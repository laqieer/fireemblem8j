	.syntax unified
	.set sub_8003E6C, 0x08003E6C + 1
	.section .text.sub_808CDEC, "ax", %progbits
@ sub_808CDEC @ JP 0x0808CDEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808CDEC
	.thumb_func
sub_808CDEC:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r7, #0
	movs r6, #0x10
	str r7, [r4]
	str r7, [r5]
_0808CDFE:
	ldrb r0, [r3]
	cmp r0, #7
	bgt _0808CE20
	cmp r0, #4
	bge _0808CE48
	cmp r0, #1
	beq _0808CE3C
	cmp r0, #1
	bgt _0808CE16
	cmp r0, #0
	beq _0808CE7E
	b _0808CE90
_0808CE16:
	cmp r0, #2
	beq _0808CE4C
	cmp r0, #3
	beq _0808CE62
	b _0808CE90
_0808CE20:
	cmp r0, #0x19
	ble _0808CE2A
	cmp r0, #0x80
	beq _0808CE38
	b _0808CE90
_0808CE2A:
	cmp r0, #0x18
	bge _0808CE46
	cmp r0, #0x14
	bgt _0808CE90
	cmp r0, #0x12
	blt _0808CE90
	b _0808CE7E
_0808CE38:
	adds r3, #2
	b _0808CDFE
_0808CE3C:
	adds r6, #0x10
	ldr r0, [r4]
	cmp r0, r7
	bge _0808CE46
	str r7, [r4]
_0808CE46:
	movs r7, #0
_0808CE48:
	adds r3, #1
	b _0808CDFE
_0808CE4C:
	adds r3, #1
	ldr r0, [r5]
	cmp r0, r6
	bge _0808CE56
	str r6, [r5]
_0808CE56:
	movs r6, #0
	ldr r0, [r4]
	cmp r0, r7
	bge _0808CE7A
	str r7, [r4]
	b _0808CE7A
_0808CE62:
	adds r3, #1
	ldr r0, [r5]
	cmp r0, r6
	bge _0808CE6C
	str r6, [r5]
_0808CE6C:
	movs r6, #0
	adds r1, r7, #0
	adds r1, #8
	ldr r0, [r4]
	cmp r0, r1
	bge _0808CE7A
	str r1, [r4]
_0808CE7A:
	movs r7, #0
	b _0808CDFE
_0808CE7E:
	ldr r0, [r4]
	cmp r0, r7
	bge _0808CE86
	str r7, [r4]
_0808CE86:
	ldr r0, [r5]
	cmp r0, r6
	bge _0808CEA0
	str r6, [r5]
	b _0808CEA0
_0808CE90:
	adds r0, r3, #0
	mov r1, sp
	bl sub_8003E6C
	adds r3, r0, #0
	ldr r0, [sp]
	adds r7, r7, r0
	b _0808CDFE
_0808CEA0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

