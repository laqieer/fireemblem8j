	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_8070F94, 0x08070F94 + 1
	.set sub_80710AC, 0x080710AC + 1
	.set sub_80710DC, 0x080710DC + 1
	.section .text.sub_8071734, "ax", %progbits
@ sub_8071734 @ JP 0x08071734 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071734
	.thumb_func
sub_8071734:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_8070F08
	adds r6, r0, #0
	ldr r0, _08071788 @ =0x08603D08
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x33
	strh r0, [r4, #0x2e]
	ldr r3, _0807178C @ =0x086A1CEC
	adds r0, r5, #0
	movs r1, #1
	adds r2, r3, #0
	bl sub_8070F94
	str r0, [r4, #0x60]
	ldrh r1, [r6, #6]
	ldrh r2, [r0, #2]
	adds r1, r1, r2
	strh r1, [r0, #2]
	ldrh r1, [r6, #8]
	ldrh r2, [r0, #4]
	adds r1, r1, r2
	strh r1, [r0, #4]
	ldr r0, [r4, #0x5c]
	ldr r1, _08071790 @ =0x0869D100
	bl sub_80710DC
	ldr r0, [r4, #0x5c]
	ldr r1, _08071794 @ =0x0869CEAC
	bl sub_80710AC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08071788: .4byte 0x08603D08
_0807178C: .4byte 0x086A1CEC
_08071790: .4byte 0x0869D100
_08071794: .4byte 0x0869CEAC

