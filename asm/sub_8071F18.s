	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F94, 0x08070F94 + 1
	.set sub_80710AC, 0x080710AC + 1
	.set sub_80710DC, 0x080710DC + 1
	.section .text.sub_8071F18, "ax", %progbits
@ sub_8071F18 @ JP 0x08071F18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071F18
	.thumb_func
sub_8071F18:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_8070F08
	ldr r0, _08071F78 @ =0x08604374
	adds r1, r5, #0
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r6, #0
	strh r6, [r5, #0x2c]
	ldr r3, _08071F7C @ =0x086EA634
	adds r0, r4, #0
	movs r1, #1
	adds r2, r3, #0
	bl sub_8070F94
	str r0, [r5, #0x60]
	ldrh r1, [r0, #2]
	subs r1, #0x38
	strh r1, [r0, #2]
	ldrh r1, [r0, #4]
	adds r1, #0xc
	strh r1, [r0, #4]
	strh r6, [r0, #6]
	movs r1, #0x14
	strh r1, [r0, #0xa]
	ldrh r2, [r0, #8]
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	bl AnimSort
	ldr r0, [r5, #0x5c]
	ldr r1, _08071F80 @ =0x086EA344
	bl sub_80710DC
	ldr r0, [r5, #0x5c]
	ldr r1, _08071F84 @ =0x086E9E38
	bl sub_80710AC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071F78: .4byte 0x08604374
_08071F7C: .4byte 0x086EA634
_08071F80: .4byte 0x086EA344
_08071F84: .4byte 0x086E9E38

