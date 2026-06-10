	.syntax unified
	.set AiSetMovCostTableWithPassableWalls, 0x08040D4C + 1
	.set sub_801A1B8, 0x0801A1B8 + 1
	.set sub_801B668, 0x0801B668 + 1
	.section .text.sub_8040EA8, "ax", %progbits
@ sub_8040EA8 @ JP 0x08040EA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8040EA8
	.thumb_func
sub_8040EA8:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl AiSetMovCostTableWithPassableWalls
	ldr r0, _08040ED0 @ =0x0202E4E0
	ldr r0, [r0]
	bl sub_801B668
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl sub_801A1B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040ED0: .4byte 0x0202E4E0

