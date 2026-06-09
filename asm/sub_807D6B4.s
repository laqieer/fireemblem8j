	.syntax unified
	.set HideMu, 0x0807BBE8 + 1
	.set sub_807A888, 0x0807A888 + 1
	.section .text.sub_807D6B4, "ax", %progbits
@ sub_807D6B4 @ JP 0x0807D6B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807D6B4
	.thumb_func
sub_807D6B4:
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	cmp r6, #0
	beq _0807D6FA
	ldr r5, _0807D700 @ =0x0203E1EC
	lsls r4, r0, #2
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r5
	str r2, [r0]
	adds r0, r5, #4
	adds r0, r4, r0
	str r6, [r0]
	adds r0, r2, #0
	bl sub_807A888
	adds r5, #8
	adds r4, r4, r5
	str r0, [r4]
	ldr r0, [r0, #0x30]
	movs r1, #0
	strh r1, [r0, #0x18]
	ldr r0, [r4]
	ldr r0, [r0, #0x30]
	strh r1, [r0, #0x1a]
	adds r0, r6, #0
	adds r0, #0x55
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0807D6F4
	cmp r0, #0x33
	bne _0807D6FA
_0807D6F4:
	ldr r0, [r4]
	bl HideMu
_0807D6FA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D700: .4byte 0x0203E1EC

