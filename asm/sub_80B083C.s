	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_808B824, 0x0808B824 + 1
	.section .text.sub_80B083C, "ax", %progbits
@ sub_80B083C @ JP 0x080B083C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B083C
	.thumb_func
sub_80B083C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	movs r6, #0
	movs r7, #0x40
_080B084C:
	ldr r0, _080B0894 @ =0x02000940
	adds r0, r6, r0
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r5, r0, #0x1f
	movs r0, #4
	ands r5, r0
	ldr r1, _080B0898 @ =0x02000948
	lsls r0, r6, #3
	adds r0, r0, r1
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _080B08A0
	ldr r0, _080B089C @ =0x02000944
	adds r0, r6, r0
	ldrb r1, [r0]
	cmp r1, #1
	bne _080B087E
	movs r0, #0x10
	orrs r5, r0
_080B087E:
	cmp r1, #2
	bne _080B088A
	movs r0, #0x20
	orrs r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_080B088A:
	cmp r1, #3
	bne _080B08B2
_080B088E:
	orrs r5, r7
	b _080B08B2
	.align 2, 0
_080B0894: .4byte 0x02000940
_080B0898: .4byte 0x02000948
_080B089C: .4byte 0x02000944
_080B08A0:
	ldr r0, _080B08EC @ =0x02000944
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, #3
	beq _080B088E
	movs r0, #0x20
	orrs r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_080B08B2:
	cmp r6, r8
	beq _080B08BE
	movs r0, #2
	orrs r5, r0
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_080B08BE:
	movs r1, #1
	adds r0, r5, #0
	orrs r0, r1
	lsls r4, r6, #1
	adds r1, r4, #0
	adds r1, #0x1a
	bl sub_808B824
	adds r4, #0x1b
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_808B824
	adds r6, #1
	cmp r6, #2
	ble _080B084C
	bl sub_8001EE4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B08EC: .4byte 0x02000944

