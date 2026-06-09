	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805C384, "ax", %progbits
@ sub_805C384 @ JP 0x0805C384 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C384
	.thumb_func
sub_805C384:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r1, _0805C3CC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805C3D0 @ =0x085FF220
	movs r1, #3
	bl sub_8002BCC
	adds r7, r0, #0
	mov r0, r8
	str r0, [r7, #0x5c]
	movs r1, #0
	mov sb, r1
	movs r0, #0
	strh r0, [r7, #0x2c]
	strh r0, [r7, #0x2e]
	str r4, [r7, #0x44]
	str r5, [r7, #0x54]
	str r6, [r7, #0x58]
	mov r0, r8
	bl GetAnimAnotherSide
	bl GetAnimPosition
	cmp r0, #0
	bne _0805C3D8
	ldr r0, _0805C3D4 @ =0x0000FFB8
	b _0805C3DA
	.align 2, 0
_0805C3CC: .4byte 0x0201774C
_0805C3D0: .4byte 0x085FF220
_0805C3D4: .4byte 0x0000FFB8
_0805C3D8:
	ldr r0, _0805C3F8 @ =0x0000FFF8
_0805C3DA:
	strh r0, [r7, #0x32]
	ldr r0, _0805C3FC @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805C406
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #0
	bne _0805C400
	ldrh r0, [r7, #0x32]
	adds r0, #0x18
	b _0805C404
	.align 2, 0
_0805C3F8: .4byte 0x0000FFF8
_0805C3FC: .4byte 0x0203E11C
_0805C400:
	ldrh r0, [r7, #0x32]
	subs r0, #0x18
_0805C404:
	strh r0, [r7, #0x32]
_0805C406:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

