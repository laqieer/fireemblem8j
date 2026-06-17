	.syntax unified
	.set DisableMapChange, 0x0802E544 + 1
	.set IsMapChangeEnabled, 0x0802E570 + 1
	.set UpdateRoofedUnits, 0x0802E5C8 + 1
	.set sub_801973C, 0x0801973C + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8019994, 0x08019994 + 1
	.set sub_8019FBC, 0x08019FBC + 1
	.set MakeNew6CBMXFADE2, 0x0801DA50 + 1
	.section .text.sub_800BE34, "ax", %progbits
@ UntriggerMapChange @ JP 0x0800BE34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UntriggerMapChange
	.thumb_func
UntriggerMapChange:
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
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0800BE7C
	cmp r5, #1
	bne _0800BE58
	bl sub_8019994
_0800BE58:
	adds r0, r4, #0
	bl sub_8019FBC
	adds r0, r4, #0
	bl DisableMapChange
	bl sub_801973C
	bl UpdateRoofedUnits
	bl sub_8019914
	cmp r6, #1
	bne _0800BE7C
	movs r0, #1
	adds r1, r7, #0
	bl MakeNew6CBMXFADE2
_0800BE7C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

