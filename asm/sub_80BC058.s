	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80BC058, "ax", %progbits
@ sub_80BC058 @ JP 0x080BC058 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BC058
	.thumb_func
sub_80BC058:
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _080BC0A8 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r0, _080BC0AC @ =0x08A7CD1C
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080BC0B0 @ =0x08A7B098
	ldr r1, _080BC0B4 @ =0x06004000
	bl sub_8013008
	ldr r0, _080BC0B8 @ =0x02023CA8
	ldr r1, _080BC0BC @ =0x085CFC90
	movs r2, #0xa4
	lsls r2, r2, #7
	bl j_TmApplyTsa
	movs r0, #4
	bl BG_EnableSyncByMask
	adds r4, #0x4c
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BC0A8: .4byte 0x03003020
_080BC0AC: .4byte 0x08A7CD1C
_080BC0B0: .4byte 0x08A7B098
_080BC0B4: .4byte 0x06004000
_080BC0B8: .4byte 0x02023CA8
_080BC0BC: .4byte 0x085CFC90

