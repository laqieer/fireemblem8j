	.syntax unified
	.set ApplyEnabledMapChanges, 0x0802E368 + 1
	.set ApplyWaterShadowsBmMap, 0x080192FC + 1
	.set InitBaseTilesBmMap, 0x0801967C + 1
	.set sub_8019584, 0x08019584 + 1
	.set sub_801973C, 0x0801973C + 1
	.section .text.sub_8019450, "ax", %progbits
@ sub_8019450 @ JP 0x08019450 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019450
	.thumb_func
sub_8019450:
	push {lr}
	ldr r0, _08019474 @ =0x02001000
	ldr r1, _08019478 @ =0x0202BCEC
	ldrb r1, [r1, #0xe]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8019584
	bl InitBaseTilesBmMap
	bl ApplyEnabledMapChanges
	bl sub_801973C
	bl ApplyWaterShadowsBmMap
	pop {r0}
	bx r0
	.align 2, 0
_08019474: .4byte 0x02001000
_08019478: .4byte 0x0202BCEC

