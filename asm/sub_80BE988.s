	.syntax unified
	.set sub_80C2B14, 0x080C2B14 + 1
	.section .text.sub_80BE988, "ax", %progbits
@ sub_80BE988 @ JP 0x080BE988 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE988
	.thumb_func
sub_80BE988:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r4, #4
	ldr r6, _080BE9D0 @ =0x03005270
	movs r0, #0xcc
	adds r0, r0, r6
	mov r8, r0
	adds r5, r6, #0
	adds r5, #0x10
_080BE99E:
	movs r1, #0x12
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _080BE9BC
	ldrb r0, [r6, #0x11]
	ldrb r1, [r5, #0x11]
	cmp r0, r1
	bne _080BE9BC
	subs r0, r4, #4
	mov r1, r8
	strb r0, [r1]
	ldr r0, [r7, #0x54]
	adds r1, r4, #0
	bl sub_80C2B14
_080BE9BC:
	adds r5, #4
	adds r4, #1
	cmp r4, #6
	ble _080BE99E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BE9D0: .4byte 0x03005270

