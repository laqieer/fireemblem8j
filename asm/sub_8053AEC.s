	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.section .text.sub_8053AEC, "ax", %progbits
@ sub_8053AEC @ JP 0x08053AEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053AEC
	.thumb_func
sub_8053AEC:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _08053B58 @ =0x0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _08053B1E
	ldr r0, _08053B5C @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _08053B1E
	ldr r4, _08053B60 @ =0x0201FB04
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #1
	bne _08053B1E
	movs r6, #1
_08053B1E:
	cmp r6, #1
	bne _08053B52
	movs r0, #7
	strh r0, [r5, #0x2c]
	ldr r0, _08053B64 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08053B4C
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _08053B68 @ =0x02017744
	ldr r1, [r1]
	cmp r0, r1
	beq _08053B4C
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r7, #0
	bl sub_80540C0
	movs r0, #0
	strh r0, [r5, #0x2c]
_08053B4C:
	adds r0, r5, #0
	bl sub_8002DE4
_08053B52:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053B58: .4byte 0x0201774C
_08053B5C: .4byte 0x0201772C
_08053B60: .4byte 0x0201FB04
_08053B64: .4byte 0x0203E11C
_08053B68: .4byte 0x02017744

