import { i18n } from "discourse-i18n";

const LastPostHeader = <template>
  <th class="last-post" scope="col">
    {{i18n (themePrefix "lastpost")}}
  </th>
</template>;

export default LastPostHeader;