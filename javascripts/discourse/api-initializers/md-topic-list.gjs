import { apiInitializer } from "discourse/lib/api";
import LastPostContent from "../components/last-post-content";
import LastPostHeader from "../components/last-post-header";

export default apiInitializer("1.39", (api) => {
  const discoveryService = api.container.lookup("service:discovery");

  api.registerValueTransformer("topic-list-columns", ({ value: columns }) => {
    // Remove the core column which shows poster avatars:
    columns.delete("posters");
	columns.delete("activity");

    columns.add("last-post", {
        header: LastPostHeader,
        item: LastPostContent,
    });

    return columns;
  });
});