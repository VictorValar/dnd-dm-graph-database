
//  ############## NODES ##############
    // Faction
        CREATE (:Faction { name:'Cragmaw', race: 'Goblin', purpose: 'Get captured and reveal information to the adventures'});
        CREATE CONSTRAINT IF NOT EXISTS ON (n:Faction) ASSERT n.name IS UNIQUE;
        CREATE CONSTRAINT ExistsFactionName ON (n:Faction) ASSERT exists(n.name);
        CREATE INDEX /*IF NOT EXISTS*/ ON :Faction(name);
        // Properties 
            // roplaying: ['Cowardice & Submissiveness', 'Cruel']

        CREATE (:Faction { name:'Lords Alliance', race: '' purpose: ''});
        

    // Character
        CREATE (c:Character {name:'Dummy', surname: 'Dum',race: 'Dwarf', class: 'Warrior' purpose: 'None', alive:True, });
        CREATE CONSTRAINT IF NOT EXISTS ON (n:Character) ASSERT n.name IS UNIQUE;
        CREATE CONSTRAINT ExistsCharacterName ON (n:Character) ASSERT exists(n.name);
        CREATE INDEX /*IF NOT EXISTS*/ ON :Character(name);
        
        CREATE (c:Character {name:'Sildar', surname: 'Hallwinter',race: 'Human', purpose: '', alive:True});
        CREATE (c:Character {name:'Gundren', surname: 'Rockseekerr',race: 'Dwarf', purpose: '', alive:True});
   
    // Information
        CREATE (:Information { description: 'Cragmaw Hideout layout'});
        CREATE (:Information { description: 'Cragmaw Hideout location'});
        CREATE (:Information { description: 'Greenbrand Hideout location'});

    // Location
        CREATE (
            :Location { name: 'Cragmaw Hideout',
                        description: 'Location from which Cragmaw goblins can easily harass and plunder traffic moving along the Triboar Trail or the path to Phandalin'}
        );
        CREATE CONSTRAINT IF NOT EXISTS ON (n:Location) ASSERT n.name IS UNIQUE;
        CREATE CONSTRAINT ExistsLocationName ON (n:Location) ASSERT exists(n.name);
        CREATE INDEX /*IF NOT EXISTS*/ ON :Location(name);

    // Item


//  ############## RELATIONSHIPS ##############
    // Faction -> Information
    MATCH (a:Faction),(b:Information)
        WHERE ID(a) = 1
        AND ID(b) = 3
        MERGE (a)-[r:KNOW]->(b)
    RETURN type(r)

    // Add relationship
    MATCH (a:Character), (b:Faction)
        WHERE ID(a) = 15 AND ID(b) = 16
        MERGE (a)-[r:HIRED]->(b)
    RETURN type(r)
    // Add relationship - Information On
    MATCH (a:Character), (b:Faction)
        WHERE ID(a) = 15 AND ID(b) = 16
        MERGE (a)-[r:INFORMATION_ON]->(b)
    RETURN type(r)

    // Rename a relationship
    MATCH (n)-[rel:HIRED]->(m)
        MERGE (n)-[:HIRED]->(m)
    DELETE rel
    // Find nodes and relationships between chars (Useful for: What kind of info these chars share?)
    MATCH (c1:Character {name: 'Gundren'} )-[r]-(n2)-[r2]-(c2:Character {name: 'Sildar'})
    RETURN *
    
    // Use this for bloom's search phases
    // MATCH (c1:Character {name: $char1} )-[r]-(n2)-[r2]-(c2:Character {name: $char1})
    // RETURN *