
//  ############## NODES ##############
    // Faction
        CREATE (:Faction { name:'Cragmaw', race: 'Goblin', purpose: 'Get captured and reveal information to the adventures'});
        CREATE CONSTRAINT IF NOT EXISTS ON (n:Faction) ASSERT n.name IS UNIQUE;
        CREATE INDEX /*IF NOT EXISTS*/ ON :Faction(name);
        CREATE CONSTRAINT ExistsFactionName ON (n:Faction) ASSERT exists(n.name);

        CREATE (:Faction { name:'Lords Alliance', race: '' purpose: ''});
        CREATE CONSTRAINT IF NOT EXISTS ON (n:Faction) ASSERT n.name IS UNIQUE;
        CREATE INDEX /*IF NOT EXISTS*/ ON :Faction(name);
        CREATE CONSTRAINT ExistsFactionName ON (n:Faction) ASSERT exists(n.name);

    //Character
        CREATE n = (c:Character {character_id: 1, name:'Sildar Hallwinter', race: 'Human'});
        CREATE CONSTRAINT IF NOT EXISTS ON (n:Character) ASSERT n.name IS UNIQUE;
        CREATE INDEX /*IF NOT EXISTS*/ ON :Character(name);
        // Properties 
            // roplaying: ['Cowardice & Submissiveness', 'Cruel']

    // Information
        CREATE (:Information { information_id: 1, description: 'Cragmaw Hideout layout'})
        CREATE CONSTRAINT ON (i:Information) ASSERT i.information_id IS UNIQUE
        CREATE (:Information { information_id: 2, description: 'Cragmaw Hideout location'})
        CREATE (:Information { information_id: 3, description: 'Greenbrand Hideout location'})

    // Location
        CREATE (:Location { location_id: 1, name: 'Cragmaw Hideout', description: 'Location from which Cragmaw goblins can easily harass and plunder traffic moving along the Triboar Trail or the path to Phandalin'})
        CREATE CONSTRAINT ON (n:Location) ASSERT n.location_id IS UNIQUE
    // Item
    // Quest for

//  ############## RELATIONSHIPS ##############
    // Faction -> Information
    MATCH (f:Faction),(i:Information)
        WHERE f.faction_id = 1
        AND i.information_id = 1
        CREATE (f)-[k:Know]->(i)
        RETURN k

    // Rename a relationship
        MATCH (n)-[rel:Captured]->(m)
        MERGE (m)-[:PRISIONER]->(n)
        DELETE rel