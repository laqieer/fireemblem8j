	.syntax unified
	.set CheckEkrTriangleInvalid, 0x08077374 + 1
	.set nullsub_51, 0x08077390 + 1
	.section .text.sub_80510AC, "ax", %progbits
@ sub_80510AC @ JP 0x080510AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80510AC
	.thumb_func
sub_80510AC:
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrTriangleInvalid
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080510C8
	bl nullsub_51
	movs r0, #0x1e
	strh r0, [r4, #0x2c]
	ldr r0, _080510D0 @ =ekrBattleTriggerNewRoundStart
	str r0, [r4, #0xc]
_080510C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080510D0: .4byte 0x080510D5  @ ekrBattleTriggerNewRoundStart

