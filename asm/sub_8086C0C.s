	.syntax unified
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_8086C0C, "ax", %progbits
@ sub_8086C0C @ JP 0x08086C0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086C0C
	.thumb_func
sub_8086C0C:
	push {r4, r5, r6, lr}
	sub sp, #0x20
	movs r6, #0
	movs r5, #0
	ldr r1, _08086C5C @ =0x08A5F7D0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _08086C40
	adds r4, r1, #0
	adds r4, #0xc
_08086C20:
	ldr r0, [r4]
	bl sub_80D65BC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08086C36
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
	adds r5, #1
_08086C36:
	adds r4, #0x18
	adds r6, #1
	ldr r0, [r4]
	cmp r0, #0
	bne _08086C20
_08086C40:
	cmp r5, #0
	beq _08086C60
	bl sub_8000CD8
	adds r1, r0, #0
	movs r0, #0x3f
	ands r0, r1
	adds r1, r5, #0
	bl __umodsi3
	add r0, sp
	ldrb r0, [r0]
	b _08086C62
	.align 2, 0
_08086C5C: .4byte 0x08A5F7D0
_08086C60:
	movs r0, #0xff
_08086C62:
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

