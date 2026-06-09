	.syntax unified
	.set NewEfxLokmsunaOBJ, 0x0806F8C4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806F88C, "ax", %progbits
@ sub_806F88C @ JP 0x0806F88C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F88C
	.thumb_func
sub_806F88C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0806F8B0 @ =0x0201774C
	ldr r4, [r0]
	cmp r4, #0
	bne _0806F8AA
	ldr r0, _0806F8B4 @ =0x0860369C
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x5c]
	strh r4, [r0, #0x2c]
	adds r0, r5, #0
	bl NewEfxLokmsunaOBJ
_0806F8AA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806F8B0: .4byte 0x0201774C
_0806F8B4: .4byte 0x0860369C

