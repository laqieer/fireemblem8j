	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_8060D90, "ax", %progbits
@ sub_8060D90 @ JP 0x08060D90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8060D90
	.thumb_func
sub_8060D90:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08060DC8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08060DCC @ =0x0860015C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _08060DD0 @ =0x080E239C
	str r1, [r0, #0x48]
	ldr r1, _08060DD4 @ =0x086003E4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08060DD8 @ =0x08600174
	str r1, [r0, #0x54]
	ldr r1, _08060DDC @ =0x086002AC
	str r1, [r0, #0x58]
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060DC8: .4byte 0x0201774C
_08060DCC: .4byte 0x0860015C
_08060DD0: .4byte 0x080E239C
_08060DD4: .4byte 0x086003E4
_08060DD8: .4byte 0x08600174
_08060DDC: .4byte 0x086002AC

