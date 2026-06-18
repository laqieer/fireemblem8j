	.syntax unified
	.set MultiBootInit, 0x0804E754 + 1
	.section .text.sub_804EBF0, "ax", %progbits
@ MultiBootStartMaster @ JP 0x0804EBF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MultiBootStartMaster
	.thumb_func
MultiBootStartMaster:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _0804EC2A
	ldrb r0, [r5, #0x1e]
	cmp r0, #0
	beq _0804EC2A
	adds r0, r5, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804EC2A
	str r7, [r5, #0x20]
	adds r2, #0xf
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r2, r0
	subs r0, #0xf0
	adds r1, r2, r0
	ldr r0, _0804EC34 @ =0x0003FF00
	cmp r1, r0
	bls _0804EC38
_0804EC2A:
	adds r0, r5, #0
	bl MultiBootInit
	b _0804ECA0
	.align 2, 0
_0804EC34: .4byte 0x0003FF00
_0804EC38:
	adds r0, r7, r2
	str r0, [r5, #0x24]
	adds r0, r3, #4
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #8
	bhi _0804EC8C
	lsls r0, r0, #2
	ldr r1, _0804EC50 @ =_0804EC54
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804EC50: .4byte _0804EC54
_0804EC54: @ jump table
	.4byte _0804EC78 @ case 0
	.4byte _0804EC78 @ case 1
	.4byte _0804EC78 @ case 2
	.4byte _0804EC78 @ case 3
	.4byte _0804EC80 @ case 4
	.4byte _0804EC86 @ case 5
	.4byte _0804EC86 @ case 6
	.4byte _0804EC86 @ case 7
	.4byte _0804EC86 @ case 8
_0804EC78:
	lsls r4, r6, #3
	movs r0, #3
	subs r0, r0, r3
	b _0804EC8A
_0804EC80:
	movs r0, #0x38
	adds r4, r6, #0
	b _0804EC8A
_0804EC86:
	lsls r4, r6, #3
	subs r0, r3, #1
_0804EC8A:
	orrs r4, r0
_0804EC8C:
	movs r0, #0x3f
	ands r4, r0
	lsls r0, r4, #1
	movs r2, #0x7f
	rsbs r2, r2, #0
	adds r1, r2, #0
	orrs r0, r1
	strb r0, [r5, #0x1c]
	movs r0, #0xd0
	strb r0, [r5, #0x18]
_0804ECA0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

