	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80852F0, "ax", %progbits
@ sub_80852F0 @ JP 0x080852F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80852F0
	.thumb_func
sub_80852F0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	movs r4, #1
_08085300:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0808533C
	ldr r0, [r2]
	cmp r0, #0
	beq _0808533C
	ldr r0, [r2, #0xc]
	ldr r1, _08085338 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0808533C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r8
	blt _0808533C
	cmp r0, r6
	bgt _0808533C
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r7
	blt _0808533C
	cmp r0, r5
	bgt _0808533C
	movs r0, #1
	b _08085344
	.align 2, 0
_08085338: .4byte 0x00010004
_0808533C:
	adds r4, #1
	cmp r4, #0x3f
	ble _08085300
	movs r0, #0
_08085344:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

