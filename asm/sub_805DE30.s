	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805DE30, "ax", %progbits
@ sub_805DE30 @ JP 0x0805DE30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805DE30
	.thumb_func
sub_805DE30:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0805DE60 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805DE64 @ =0x085FF520
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805DE68
	movs r0, #0xd8
	b _0805DE6C
	.align 2, 0
_0805DE60: .4byte 0x0201774C
_0805DE64: .4byte 0x085FF520
_0805DE68:
	movs r0, #0xd8
	rsbs r0, r0, #0
_0805DE6C:
	str r0, [r6, #0x44]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

