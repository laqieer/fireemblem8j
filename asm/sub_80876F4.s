	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_8033168, 0x08033168 + 1
	.section .text.sub_80876F4, "ax", %progbits
@ sub_80876F4 @ JP 0x080876F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80876F4
	.thumb_func
sub_80876F4:
	push {r4, r5, r6, r7, lr}
	bl sub_8033168
	bl GetUnitFromCharId
	adds r5, r0, #0
	movs r7, #0x10
	ldrsb r7, [r5, r7]
	movs r6, #0x11
	ldrsb r6, [r5, r6]
	movs r4, #1
_0808770A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08087740
	ldr r0, [r2]
	cmp r0, #0
	beq _08087740
	cmp r2, r5
	beq _08087740
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	cmp r0, r7
	bne _08087740
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	cmp r0, r6
	bne _08087740
	ldr r1, [r2, #0xc]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08087740
	movs r0, #9
	orrs r1, r0
	str r1, [r2, #0xc]
_08087740:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808770A
	bl sub_8027144
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

