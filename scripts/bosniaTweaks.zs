import minetweaker.item.IItemStack;

// set custom oreDicts
// mysticalFlowerDict
val mysticalFlowerDict = <ore:mysticalFlowers>; 
mysticalFlowerDict.add(<Botania:flower:*>);

// mysticalPetals
val mysticalPetalDict = <ore:mysticalPetals>;
mysticalPetalDict.add(<Botania:petal:*>);

// add aspects to mystical flowers
mods.thaumcraft.Aspects.add(<Botania:flower:*>, "herba 4");

// tweak petal recipes
// variables

var BPetals = [
	<Botania:petal>, 
	<Botania:petal:1>, <Botania:petal:2>, <Botania:petal:3>, 
	<Botania:petal:4>,<Botania:petal:5>, <Botania:petal:6>,  
	<Botania:petal:7>,  <Botania:petal:8>,  <Botania:petal:9>,  
	<Botania:petal:10>, <Botania:petal:11>, <Botania:petal:12>, 
	<Botania:petal:13>, <Botania:petal:14>, <Botania:petal:15>
	] as IItemStack[];

var BFlowers = [
	<Botania:flower>, 
	<Botania:flower:1>, <Botania:flower:2>, <Botania:flower:3>, 
	<Botania:flower:4>,<Botania:flower:5>, <Botania:flower:6>,  
	<Botania:flower:7>,  <Botania:flower:8>,  <Botania:flower:9>,  
	<Botania:flower:10>, <Botania:flower:11>, <Botania:flower:12>, 
	<Botania:flower:13>, <Botania:flower:14>, <Botania:flower:15>
	] as IItemStack[];

var BTallFlowers = [
	<Botania:doubleFlower1>, 
	<Botania:doubleFlower1:1>, <Botania:doubleFlower1:2>, <Botania:doubleFlower1:3>, 
	<Botania:doubleFlower1:4>,<Botania:doubleFlower1:5>, <Botania:doubleFlower1:6>,  
	<Botania:doubleFlower1:7>,  <Botania:doubleFlower2>,  <Botania:doubleFlower2:1>,  
	<Botania:doubleFlower2:2>, <Botania:doubleFlower2:3>, <Botania:doubleFlower2:4>, 
	<Botania:doubleFlower2:5>, <Botania:doubleFlower2:6>, <Botania:doubleFlower2:7>
	] as IItemStack[];

// recipe removal
for i, petal in BPetals {
	recipes.removeShapeless(petal);
}

// add crucible petal recipes
for i, petal in BPetals {
	var flower = BFlowers[i];
	mods.thaumcraft.Crucible.addRecipe("PETALPROC", petal * 3, flower, "perditio 1");	
}

for i, petal in BPetals {
	var flower = BTallFlowers[i];
	mods.thaumcraft.Crucible.addRecipe("PETALPROC", petal * 6, flower, "perditio 2");	
}

// add aspects to petals
mods.thaumcraft.Aspects.set(<Botania:petal>, "ordo 2"); // tahara
mods.thaumcraft.Aspects.set(<Botania:petal:1>, "ignis 2"); // portokali
mods.thaumcraft.Aspects.set(<Botania:petal:2>, "sano 2"); // kurauri
mods.thaumcraft.Aspects.set(<Botania:petal:3>, " 2"); // galazio 
mods.thaumcraft.Aspects.set(<Botania:petal:4>, "potentia 2"); // kitrino
mods.thaumcraft.Aspects.set(<Botania:petal:5>, "motus 2"); // asveste
mods.thaumcraft.Aspects.set(<Botania:petal:6>, "telum 2"); // ruzova
mods.thaumcraft.Aspects.set(<Botania:petal:7>, "permutatio 2"); // ykri
mods.thaumcraft.Aspects.set(<Botania:petal:8>, "tenebrae 2"); // argia
mods.thaumcraft.Aspects.set(<Botania:petal:9>, "aqua 2"); // vadali
mods.thaumcraft.Aspects.set(<Botania:petal:10>, "superbia 2"); // zambarau
mods.thaumcraft.Aspects.set(<Botania:petal:11>, "lux 2"); // nila
mods.thaumcraft.Aspects.set(<Botania:petal:12>, "metallum 2"); // ruskea
mods.thaumcraft.Aspects.set(<Botania:petal:13>, "herba 2"); // kijani
mods.thaumcraft.Aspects.set(<Botania:petal:14>, "tutamen 2"); // karmir
mods.thaumcraft.Aspects.set(<Botania:petal:15>, "praecantatio 2"); // kuro

// thaumify recipes!!!
// petal apothecary
recipes.remove(<Botania:altar:*>);
mods.thaumcraft.Arcane.addShaped(
	"PETALPROC", 
	<Botania:altar>, 
	"aer 10, terra 10, ignis 10, aqua 10, ordo 10, perditio 10", 
	[
		[<minecraft:stone_slab:3>, <ore:mysticalPetals>, <minecraft:stone_slab:3>],
		[null, <ore:cobblestone>, null],
		[<ore:cobblestone>, <Thaumcraft:ItemResource:14>, <ore:cobblestone>]
	]
);

// mana spreader
recipes.remove(<Botania:spreader>);
mods.thaumcraft.Arcane.addShaped(
	"MANASPREADER", 
	<Botania:spreader>, 
	"aer 10, aqua 10, ordo 10, terra", 
	[
		[<ore:livingwood>, <ore:livingwood>, <ore:livingwood>],
		[<ore:ingotGold>, <ore:mysticalPetals>, null],
		[<ore:livingwood>, <ore:livingwood>, <ore:livingwood>]
	]
);

// diluted mana pool
recipes.remove(<Botania:pool:2>);
mods.thaumcraft.Arcane.addShaped(
	"SHITPOOL", 
	<Botania:pool:2>, 
	"aer 20, aqua 20, terra 20, ignis 20, ordo 20, perditio 20", 
	[
		[null, null, null],
		[<Botania:livingrock0Slab>, null, <Botania:livingrock0Slab>],
		[<Botania:livingrock0Slab>, <Botania:livingrock0Slab>, <Botania:livingrock0Slab>]
	]
);

// mana pool
recipes.remove(<Botania:pool>);
mods.botania.ManaInfusion.addInfusion(<Botania:pool>, <Botania:pool:2>, 20000);

// runic altar
recipes.remove(<Botania:runeAltar>);
mods.thaumcraft.Infusion.addRecipe(
	"LEXIC", 
	<Botania:livingrock> , 
	[
		<Botania:manaResource:1>, 
		<Botania:manaResource:2>, 
		<Thaumcraft:ItemResource:14>, 
		<Thaumcraft:ItemResource:14>, 
		<Botania:manaResource:2>,
		<Botania:manaResource:1>
	], 
	"praecantatio 16, permutatio 16, herba 16, potentia 16",
	<Botania:runeAltar>,
	5
);

// alchemy catalyst
recipes.remove(<Botania:alchemyCatalyst>);
mods.thaumcraft.Infusion.addRecipe(
	"LEXIC",
	<Botania:rune:8>,
	[
		<Botania:livingrock>,
		<minecraft:gold_ingot>,
		<Thaumcraft:ItemResource:14>,
		<Thaumcraft:ItemResource:14>,
		<minecraft:gold_ingot>,
		<Botania:livingrock>
	],
	"praecantatio 32, permutatio 32, alienis 16, ordo 16, perditio 16",
	<Botania:alchemyCatalyst>,
	6
);

// thaumonomicon!!
mods.thaumcraft.Research.addTab("BOTANIA", "botania", "textures/items/blackLotus.png");
game.setLocalization("en_US", "tc.research_category.BOTANIA", "Botanic World");

mods.thaumcraft.Research.addResearch("LEXIC", "BOTANIA", "", 1, 0, 10, <Botania:lexicon>);
mods.thaumcraft.Research.setRound("LEXIC", true);
mods.thaumcraft.Research.setAutoUnlock("LEXIC", true);
game.setLocalization("en_US", "tc.research_name.LEXIC", "Botanic World");
game.setLocalization("en_US", "tc.research_text.LEXIC", "[FoT] What the colors hide");
mods.thaumcraft.Research.addPage("LEXIC", "bot1.research_page.LEXIC");
game.setLocalization(
	"en_US",
	"bot1.research_page.LEXIC", 
	"Throughout the world, you've come across many phenomena. Aura nodes, eldritch obelisks, sinister totems. But the one that stood out the most were the Mystical Flowers. These flowers seem to be alike any other plant, but the true mystery is in their petals. They are magical, but in a way you simply can't wrap your head around. They hold both primal and compound aspects, confusingly enough - you have a theory on that, though."
);
mods.thaumcraft.Research.addPage("LEXIC", "bot2.research_page.LEXIC");
game.setLocalization(
	"en_US", 
	"bot2.research_page.LEXIC", 
	"They must hold a magic different than what you're used to. Instead of the six primal aspects, each flower channels one of 16 colorful elements, each representing something that makes up this newfound form of magic. You believe further study on this may help you on your journey."
);
mods.thaumcraft.Research.addCraftingPage("LEXIC", <Botania:lexicon>);

mods.thaumcraft.Research.addResearch("PETALPROC", "BOTANIA", "perditio 1, herba 1, praecantatio 1", 3, 0, 1, <Botania:petal>);
game.setLocalization("en_US", "tc.research_name.PETALPROC", "Petal Processing");
game.setLocalization("en_US", "tc.research_text.PETALPROC", "[FoT] Making good use of colors");
mods.thaumcraft.Research.addPrereq("PETALPROC", "LEXIC", false);
mods.thaumcraft.Research.addPage("PETALPROC", "bot1.research_page.PETALPROC");
game.setLocalization(
	"en_US",
	"bot1.research_page.PETALPROC", 
	"You are now able to separate the petals from the flowers efficiently with alchemy. It's more efficient than doing it by hand, and you're not one to let things to go to waste. <LINE> These petals open up the opportunity to make new flowers out of them. This must be researched."
);
mods.thaumcraft.Research.addCruciblePage("PETALPROC", <Botania:petal:15>);

mods.thaumcraft.Research.addResearch("PETALAP", "BOTANIA", "herba 1, fabrico 1, praecantatio 1", 5, 0, 1, <Botania:altar>);
game.setLocalization("en_US", "tc.research_name.PETALAP", "Petal Apothecary");
game.setLocalization("en_US", "tc.research_text.PETALAP", "[FoT] Artificial botany");
mods.thaumcraft.Research.setConcealed("PETALAP", true);
mods.thaumcraft.Research.addPrereq("PETALAP", "PETALPROC", false);
mods.thaumcraft.Research.addPage("PETALAP", "bot1.research_page.PETALAP");
game.setLocalization(
	"en_US",
	"bot1.research_page.PETALAP", 
	"You have figured out a way to make the Apothecary the Lexica Botania speaked of. This may be rudimentary, but with the right combination of materials, you're able to craft the flowers the Lexica speaks of."
);
mods.thaumcraft.Research.addArcanePage("PETALAP", <Botania:altar>);

mods.thaumcraft.Research.addResearch("SHITPOOL", "BOTANIA", "terra 1, fabrico 1, praecantatio 1, vinculum 1", 7, 1, 0, <Botania:pool:2>);
game.setLocalization("en_US", "tc.research_name.SHITPOOL", "Diluted Mana Pool");
game.setLocalization("en_US", "tc.research_text.SHITPOOL", "[FoT] Botanical storage");
mods.thaumcraft.Research.setConcealed("SHITPOOL", true);
mods.thaumcraft.Research.addPrereq("SHITPOOL", "PETALAP", false);
mods.thaumcraft.Research.addPage("SHITPOOL", "bot1.research_page.SHITPOOL");
game.setLocalization(
	"en_US",
	"bot1.research_page.SHITPOOL", 
	"The mana the Lexica Botania speaks of seems to be a magical energy, similar to how you use Vis for your artifice, but its rules are considerably different. As such, you have designed a - rather rudimentary - storage option for it. <BR> You think it can be improved rather easily, but you may need to acquire mana before trying to improve it."
);
mods.thaumcraft.Research.addArcanePage("SHITPOOL", <Botania:pool:2>);

mods.thaumcraft.Research.addResearch("MANASPREADER", "BOTANIA", "arbor 1, permutatio 1, praecantatio 1, aqua 1", 7, -1 as int, 0, <Botania:spreader>);
game.setLocalization("en_US", "tc.research_name.MANASPREADER", "Mana Spreader");
game.setLocalization("en_US", "tc.research_text.MANASPREADER", "[FoT] Botanical transfer");
mods.thaumcraft.Research.setConcealed("MANASPREADER", true);
mods.thaumcraft.Research.addPrereq("MANASPREADER", "PETALAP", false);
mods.thaumcraft.Research.addPage("MANASPREADER", "bot1.research_page.MANASPREADER");
game.setLocalization(
	"en_US",
	"bot1.research_page.MANASPREADER", 
	"The mana the Lexica Botania speaks of seems to be a magical energy, similar to how you use Vis for your artifice, but its rules are considerably different. As such, you have designed a transfer device for it. Coupled with a mana storage, this should be all you need to start producing mana. <BR> Its design allows for easy improvements to its transfer capabilites, although you haven't found a way to amplify its effects yet."
);
mods.thaumcraft.Research.addArcanePage("MANASPREADER", <Botania:spreader>);

mods.thaumcraft.Research.addResearch("MANARESOURCE", "BOTANIA", "praecantatio 10, permutatio 10, herba 10", 10, 0, 0, <Botania:manaResource>);
game.setLocalization("en_US", "tc.research_name.MANARESOURCE", "Mana Resources");
game.setLocalization("en_US", "tc.research_text.MANARESOURCE", "[FoT] Materials for a new world");
mods.thaumcraft.Research.setSecondary("MANARESOURCE", true);
mods.thaumcraft.Research.setRound("MANARESOURCE", true);
mods.thaumcraft.Research.addPrereq("MANARESOURCE", "SHITPOOL", false);
mods.thaumcraft.Research.addPrereq("MANARESOURCE", "MANASPREADER", false);
