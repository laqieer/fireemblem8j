	.syntax unified
	.section .text.sub_8001570, "ax", %progbits
@ sub_8001570 @ JP 0x08001570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001570
	.thumb_func
sub_8001570:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	adds r7, r1, #0
	ldr r0, [sp, #0x20]
	lsls r2, r2, #0x10
	asrs r1, r2, #0x10
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrb r0, [r7]
	adds r6, r0, #1
	ldrb r0, [r7, #1]
	adds r2, r0, #1
	mov ip, r6
	mov r8, r2
	adds r7, #2
	movs r4, #0
	movs r5, #0
	adds r0, r1, r6
	cmp r0, #0x20
	ble _080015AE
	movs r0, #0x20
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
_080015AE:
	cmp r1, #0
	bge _080015C0
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	subs r0, r6, r5
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r1, #0
_080015C0:
	cmp r6, #0
	ble _08001640
	adds r0, r3, r2
	cmp r0, #0x20
	ble _080015D2
	movs r0, #0x20
	subs r0, r0, r3
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
_080015D2:
	cmp r3, #0
	bge _080015E4
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	subs r0, r2, r4
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	movs r3, #0
_080015E4:
	cmp r2, #0
	ble _08001640
	adds r0, r4, r2
	mov r4, r8
	subs r0, r4, r0
	mov r4, ip
	muls r4, r0, r4
	adds r0, r4, #0
	lsls r0, r0, #1
	adds r7, r7, r0
	adds r0, r3, r2
	subs r0, #1
	lsls r0, r0, #6
	add r0, sl
	lsls r1, r1, #1
	adds r1, r0, r1
	subs r0, r2, #1
	cmp r0, #0
	blt _08001640
	lsls r5, r5, #1
	mov r8, r5
	mov r2, ip
	lsls r2, r2, #1
	mov ip, r2
_08001614:
	adds r2, r1, #0
	mov r4, r8
	adds r3, r7, r4
	adds r4, r2, #0
	subs r4, #0x40
	subs r5, r0, #1
	cmp r6, #0
	ble _08001636
	adds r1, r6, #0
_08001626:
	ldrh r0, [r3]
	add r0, sb
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _08001626
_08001636:
	add r7, ip
	adds r1, r4, #0
	adds r0, r5, #0
	cmp r0, #0
	bge _08001614
_08001640:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

