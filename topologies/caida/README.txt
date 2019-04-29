The 'serial-2' directory contains AS relationships that combine the
'serial-1' AS relationships (inferred using the method described in
"AS Relationships, Customer Cones, and Validation" published in
IMC 2013, http://www.caida.org/publications/papers/2013/asrank/),
with AS relationships inferred from Ark traceroutes, and from
multilateral peering
(http://www.caida.org/publications/papers/2013/inferring_multilateral_peering/).
 
To do this we first infer which AS owns each router independent of the
interface addresses observed at that router. The ownership inferences
are based on IP-to-AS mapping derived from public BGP data, list of
peering prefixes from PeeringDB, and the previously inferred business AS
relationships. Then we convert the observed IP path into an AS path
using the router ownership information (rather than mapping each
observed IP to AS directly) and retain the first AS link in the
resulting path for the AS graph.
 
The as-rel files contain p2p and p2c relationships.  The format is:
<provider-as>|<customer-as>|-1
<peer-as>|<peer-as>|0|<source>

------------------------
Acceptable Use Agreement
------------------------
 
The AUA that you accepted when you were given access to these datas is included
in pdf format as a separate file in the same directory as this README file.
When referencing this data (as required by the AUA), please use:
 
    The CAIDA AS Relationships Dataset, <date range used>
    http://www.caida.org/data/active/as-relationships/
 
Also, please, report your publication to CAIDA
(http://www.caida.org/data/publications/report-publication.xml).
