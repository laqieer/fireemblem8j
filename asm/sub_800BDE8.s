	.syntax unified
	.set ApplyMapChangesById, 0x0802E4C4 + 1
	.set EnableMapChange, 0x0802E530 + 1
	.set IsMapChangeEnabled, 0x0802E570 + 1
	.set UpdateRoofedUnits, 0x0802E5C8 + 1
	.set sub_801973C, 0x0801973C + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8019994, 0x08019994 + 1
	.set MakeNew6CBMXFADE2, 0x0801DA50 + 1
	.section .text.sub_800BDE8, "ax", %progbits
@ TriggerMapChanges @ JP 0x0800BDE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global TriggerMapChanges
	.thumb_func
TriggerMapChanges:
	push {r4, r5, r6, r7, lr}
	adds r7, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r0, #0
	lsls r1, r1, #0x18
	asrs r5, r1, #0x18
	adds r6, r5, #0
	bl IsMapChangeEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800BE2E
	cmp r5, #1
	bne _0800BE0A
	bl sub_8019994
_0800BE0A:
	adds r0, r4, #0
	bl ApplyMapChangesById
	adds r0, r4, #0
	bl EnableMapChange
	bl sub_801973C
	bl UpdateRoofedUnits
	bl sub_8019914
	cmp r6, #1
	bne _0800BE2E
	movs r0, #1
	adds r1, r7, #0
	bl MakeNew6CBMXFADE2
_0800BE2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

