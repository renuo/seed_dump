require 'rgl/adjacency'
require 'rgl/topsort'

class SeedDump
  class DependencyUnwrangler
    def initialize(models)
      @models = models
      @graph = RGL::DirectedAdjacencyGraph.new
      @evaluation_order = []
    end

    def evaluation_order
      return [] if @models.empty?
      return @evaluation_order unless @evaluation_order.empty?

      build_graph unless graph_built?

      @evaluation_order = @graph.topsort_iterator.to_a.reverse
      @evaluation_order
    end

    private

    def build_graph
      models.map do |model|
        referents_by_model(model).each do |_refrent|
          @graph.add_edge(model, referent)
        end
      end
    end

    def graph_built?
      !@graph.edges.empty? && !@graph.vertices.empty?
    end

    def referents_by_model(model)
      associations = model.reflect_on_all_associations(:belongs_to)
      associations.map do |association|
        association.options[:polymorphic] ? collect_polymorphic_deps(association) : association.klass
      end.flatten
    end

    def collect_polymorphic_deps(association)
      ActiveRecord::Base.descendants.select do |other_model|
        other_model.reflect_on_all_associations(:has_many).any? do |has_many_association|
          has_many_association.options[:as] == association.name
        end
      end
    end
  end
end
