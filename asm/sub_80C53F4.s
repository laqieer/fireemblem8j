	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set _DivArm1, 0x0800BAD0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C3144, 0x080C3144 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C53F4, "ax", %progbits
@ sub_80C53F4 @ JP 0x080C53F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C53F4
	.thumb_func
sub_80C53F4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5, #0x2c]
	cmp r0, r1
	bhs _080C5480
	ldrh r0, [r5, #0x2a]
	ldrh r1, [r5, #0x2c]
	movs r2, #1
	bl _DivArm1
	mov r8, r0
	movs r7, #0
	movs r2, #0x2e
	adds r2, r2, r5
	mov sb, r2
	movs r3, #0x80
	lsls r3, r3, #5
	mov sl, r3
	adds r6, r5, #0
	adds r6, #0x30
_080C542E:
	movs r1, #0x10
	ldrsh r0, [r6, r1]
	mov r1, r8
	muls r1, r0, r1
	mov r0, sl
	bl sub_80D6378
	ldrh r5, [r6]
	adds r5, r5, r0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0x12
	ldrsh r0, [r6, r2]
	mov r1, r8
	muls r1, r0, r1
	mov r0, sl
	bl sub_80D6378
	ldrh r4, [r6, #2]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, _080C547C @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r3, sb
	adds r1, r3, r7
	ldrb r1, [r1]
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_80C3144
	adds r6, #4
	adds r7, #1
	cmp r7, #1
	ble _080C542E
	b _080C54B8
	.align 2, 0
_080C547C: .4byte 0x08AC1108
_080C5480:
	movs r7, #0
	movs r6, #0x2e
	adds r6, r6, r5
	mov sb, r6
	adds r4, r5, #0
	adds r4, #0x38
_080C548C:
	ldr r0, _080C54C8 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	mov r2, sb
	adds r1, r2, r7
	ldrb r1, [r1]
	movs r3, #0
	ldrsh r2, [r4, r3]
	movs r6, #2
	ldrsh r3, [r4, r6]
	bl sub_80C3144
	adds r4, #4
	adds r7, #1
	cmp r7, #1
	ble _080C548C
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl sub_8002DE4
_080C54B8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C54C8: .4byte 0x08AC1108

