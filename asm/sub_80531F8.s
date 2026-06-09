	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_805AFC0, 0x0805AFC0 + 1
	.set sub_805B094, 0x0805B094 + 1
	.section .text.sub_80531F8, "ax", %progbits
@ sub_80531F8 @ JP 0x080531F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80531F8
	.thumb_func
sub_80531F8:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08053240 @ =0x0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _08053290
	ldr r0, _08053244 @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _08053290
	strh r0, [r5, #0x2c]
	movs r0, #1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x64]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl sub_805B094
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	bl sub_805AFC0
	cmp r0, #1
	bne _0805328A
	ldr r0, _08053248 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0805328A
	lsls r0, r0, #2
	ldr r1, _0805324C @ =_08053250
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08053240: .4byte 0x0201774C
_08053244: .4byte 0x0201772C
_08053248: .4byte 0x0203E11C
_0805324C: .4byte _08053250
_08053250: @ jump table
	.4byte _08053264 @ case 0
	.4byte _08053264 @ case 1
	.4byte _08053278 @ case 2
	.4byte _08053264 @ case 3
	.4byte _08053264 @ case 4
_08053264:
	movs r0, #0x10
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _0805328A
_08053278:
	movs r0, #0x14
	strh r0, [r5, #0x2e]
	adds r0, r4, #0
	bl GetAnimAnotherSide
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_0805328A:
	adds r0, r5, #0
	bl sub_8002DE4
_08053290:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

