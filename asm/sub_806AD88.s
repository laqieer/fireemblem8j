	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806AD88, "ax", %progbits
@ sub_806AD88 @ JP 0x0806AD88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806AD88
	.thumb_func
sub_806AD88:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806ADB4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806ADB8 @ =0x08602948
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806ADBC @ =0x080E3FB6
	str r1, [r0, #0x48]
	ldr r1, _0806ADC0 @ =0x08752984
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806ADB4: .4byte 0x0201774C
_0806ADB8: .4byte 0x08602948
_0806ADBC: .4byte 0x080E3FB6
_0806ADC0: .4byte 0x08752984

