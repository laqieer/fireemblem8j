	.syntax unified
	.set sub_80C5604, 0x080C5604 + 1
	.section .text.sub_80BE44C, "ax", %progbits
@ sub_80BE44C @ JP 0x080BE44C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE44C
	.thumb_func
sub_80BE44C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _080BE4B0 @ =0x03005270
	ldr r1, [r0, #8]
	asrs r1, r1, #8
	mov r8, r1
	ldr r0, [r0, #0xc]
	asrs r7, r0, #8
	movs r5, #0xf0
	lsls r5, r5, #7
	movs r6, #0
	movs r4, #0
_080BE468:
	ldr r1, _080BE4B0 @ =0x03005270
	lsls r0, r4, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BE49C
	lsls r1, r4, #5
	ldr r0, _080BE4B4 @ =0x081F5D7C
	adds r1, r1, r0
	movs r0, #0x18
	ldrsh r2, [r1, r0]
	movs r0, #0x1a
	ldrsh r3, [r1, r0]
	movs r0, #5
	str r0, [sp]
	mov r0, r8
	adds r1, r7, #0
	bl sub_80C5604
	cmp r0, r5
	bge _080BE49C
	adds r6, r4, #0
	adds r5, r0, #0
_080BE49C:
	adds r4, #1
	cmp r4, #0x1c
	ble _080BE468
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BE4B0: .4byte 0x03005270
_080BE4B4: .4byte 0x081F5D7C

