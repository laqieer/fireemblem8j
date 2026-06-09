	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8068600, 0x08068600 + 1
	.section .text.sub_806830C, "ax", %progbits
@ sub_806830C @ JP 0x0806830C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806830C
	.thumb_func
sub_806830C:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bne _08068338
	ldr r0, [r4, #0x5c]
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x68
	movs r3, #0xc
	bl sub_8068600
	b _080683FA
_08068338:
	cmp r1, #3
	bne _0806834E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x68
	movs r3, #0x5f
	bl sub_8068600
	b _080683FA
_0806834E:
	cmp r1, #6
	bne _08068364
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x78
	movs r3, #0x24
	bl sub_8068600
	b _080683FA
_08068364:
	cmp r1, #9
	bne _0806837A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x64
	movs r3, #0xa
	bl sub_8068600
	b _080683FA
_0806837A:
	cmp r1, #0xc
	bne _0806838E
	ldr r0, [r4, #0x5c]
	str r2, [sp]
	movs r1, #0x1a
	movs r2, #0x5e
	movs r3, #0x36
	bl sub_8068600
	b _080683FA
_0806838E:
	cmp r1, #0xf
	bne _080683A4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x64
	movs r3, #0x30
	bl sub_8068600
	b _080683FA
_080683A4:
	cmp r1, #0x12
	bne _080683B8
	ldr r0, [r4, #0x5c]
	str r2, [sp]
	movs r1, #0x1a
	movs r2, #0x68
	movs r3, #0x66
	bl sub_8068600
	b _080683FA
_080683B8:
	cmp r1, #0x15
	bne _080683CE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x60
	movs r3, #0x10
	bl sub_8068600
	b _080683FA
_080683CE:
	cmp r1, #0x18
	bne _080683E4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	str r1, [sp]
	movs r1, #0x1a
	movs r2, #0x80
	movs r3, #0x50
	bl sub_8068600
	b _080683FA
_080683E4:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080683FA
	ldr r1, _08068404 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_080683FA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068404: .4byte 0x0201774C

