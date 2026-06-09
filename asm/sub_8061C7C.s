	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8061C7C, "ax", %progbits
@ sub_8061C7C @ JP 0x08061C7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061C7C
	.thumb_func
sub_8061C7C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08061CB4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061CB8 @ =0x08600914
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	strh r5, [r0, #0x30]
	str r1, [r0, #0x44]
	ldr r1, _08061CBC @ =0x080E2780
	str r1, [r0, #0x48]
	ldr r1, _08061CC0 @ =0x0867F12C
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl sub_80567E0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061CB4: .4byte 0x0201774C
_08061CB8: .4byte 0x08600914
_08061CBC: .4byte 0x080E2780
_08061CC0: .4byte 0x0867F12C

