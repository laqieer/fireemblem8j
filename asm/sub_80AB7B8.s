	.syntax unified
	.section .text.sub_80AB7B8, "ax", %progbits
@ sub_80AB7B8 @ JP 0x080AB7B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB7B8
	.thumb_func
sub_80AB7B8:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r7, r1, #0
	movs r1, #0
	adds r0, r7, #7
_080AB7C8:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r7
	bge _080AB7C8
	movs r5, #0
	movs r0, #0
	movs r1, #1
	mov r8, r1
_080AB7D8:
	movs r4, #0
	adds r1, r0, #1
	mov ip, r1
	lsls r0, r0, #2
	add r0, sb
	adds r6, r0, #0
	adds r6, #0x30
_080AB7E6:
	cmp r4, #0
	beq _080AB7F0
	cmp r4, #1
	beq _080AB7F8
	b _080AB802
_080AB7F0:
	ldrb r0, [r6]
	mov r3, r8
	ands r3, r0
	b _080AB802
_080AB7F8:
	ldrb r1, [r6]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
_080AB802:
	cmp r3, #0
	beq _080AB820
	adds r2, r5, #0
	cmp r5, #0
	bge _080AB80E
	adds r2, r5, #7
_080AB80E:
	asrs r2, r2, #3
	movs r1, #7
	ands r1, r5
	adds r2, r7, r2
	mov r0, r8
	lsls r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
_080AB820:
	adds r5, #1
	adds r4, #1
	cmp r4, #1
	ble _080AB7E6
	mov r0, ip
	cmp r0, #0x1c
	ble _080AB7D8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

