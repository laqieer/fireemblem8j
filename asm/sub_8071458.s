	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F94, 0x08070F94 + 1
	.set sub_80710AC, 0x080710AC + 1
	.set sub_80710DC, 0x080710DC + 1
	.section .text.sub_8071458, "ax", %progbits
@ sub_8071458 @ JP 0x08071458 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071458
	.thumb_func
sub_8071458:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl sub_8070F08
	adds r7, r0, #0
	ldr r0, _08071494 @ =0x08603C6C
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r2, _08071498 @ =0x08622128
	ldr r3, _0807149C @ =0x086215FC
	adds r0, r5, #0
	movs r1, #1
	bl sub_8070F94
	adds r4, r0, #0
	str r4, [r6, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080714A0
	ldrh r0, [r5, #2]
	adds r0, #0x38
	b _080714A4
	.align 2, 0
_08071494: .4byte 0x08603C6C
_08071498: .4byte 0x08622128
_0807149C: .4byte 0x086215FC
_080714A0:
	ldrh r0, [r5, #2]
	subs r0, #0x38
_080714A4:
	strh r0, [r4, #2]
	ldrh r0, [r7, #6]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldrh r0, [r7, #8]
	ldrh r1, [r4, #4]
	adds r0, r0, r1
	strh r0, [r4, #4]
	ldr r0, [r6, #0x5c]
	ldr r1, _080714CC @ =0x08620B18
	bl sub_80710DC
	ldr r0, [r6, #0x5c]
	ldr r1, _080714D0 @ =0x08620680
	bl sub_80710AC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080714CC: .4byte 0x08620B18
_080714D0: .4byte 0x08620680

