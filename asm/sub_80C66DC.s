	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetGmClassUnit, 0x080C42B4 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8009608, 0x08009608 + 1
	.set sub_80C2BAC, 0x080C2BAC + 1
	.section .text.sub_80C66DC, "ax", %progbits
@ sub_80C66DC @ JP 0x080C66DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C66DC
	.thumb_func
sub_80C66DC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r7, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080C67EA
	ldr r0, _080C67FC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C6708
	ldr r0, _080C6800 @ =0x00000312
	bl m4aSongNumStart
_080C6708:
	movs r6, #0
	adds r0, r7, #0
	adds r0, #0x38
	str r0, [sp, #0x10]
	ldrb r0, [r0]
	cmp r6, r0
	bge _080C67E4
	add r1, sp, #8
	mov sl, r1
	movs r2, #0xa
	add r2, sp
	mov sb, r2
	add r3, sp, #0xc
	mov r8, r3
	adds r5, r7, #0
	adds r5, #0x2c
	movs r0, #0
	str r0, [sp, #0x14]
_080C672C:
	ldrb r0, [r5]
	lsls r0, r0, #5
	ldr r1, _080C6804 @ =0x081F5D7C
	adds r0, r0, r1
	ldrh r0, [r0, #0x18]
	mov r2, sl
	strh r0, [r2]
	ldrb r0, [r5]
	lsls r0, r0, #5
	adds r0, r0, r1
	ldrh r0, [r0, #0x1a]
	mov r3, sb
	strh r0, [r3]
	ldr r0, _080C6808 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldrh r0, [r0, #0x34]
	mov r1, r8
	strh r0, [r1]
	mov r4, sp
	adds r4, #0xe
	ldr r0, _080C6808 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldrh r2, [r0, #0x36]
	strh r2, [r4]
	mov r3, sl
	ldrh r0, [r3]
	mov r3, r8
	ldrh r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	mov r3, sb
	ldrh r0, [r3]
	subs r0, r0, r2
	adds r0, #8
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xaf
	bhi _080C67A8
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xef
	bhi _080C67A8
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	ldr r0, _080C680C @ =0x08B1CD80
	movs r3, #0xe2
	lsls r3, r3, #6
	bl sub_8009608
	adds r1, r7, #0
	adds r1, #0x3c
	ldr r2, [sp, #0x14]
	adds r1, r1, r2
	str r0, [r1]
_080C67A8:
	adds r4, r6, #4
	ldrb r1, [r5, #1]
	ldrb r3, [r5]
	adds r0, r4, #0
	movs r2, #1
	bl SetGmClassUnit
	ldr r0, _080C6810 @ =0x03005270
	lsls r1, r4, #2
	adds r1, r1, r0
	ldrb r2, [r1, #0x10]
	movs r0, #1
	orrs r0, r2
	strb r0, [r1, #0x10]
	ldr r0, _080C6808 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	bl sub_80C2BAC
	adds r5, #4
	ldr r3, [sp, #0x14]
	adds r3, #4
	str r3, [sp, #0x14]
	adds r6, #1
	ldr r0, [sp, #0x10]
	ldrb r0, [r0]
	cmp r6, r0
	blt _080C672C
_080C67E4:
	adds r0, r7, #0
	bl sub_8002DE4
_080C67EA:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C67FC: .4byte 0x0202BCEC
_080C6800: .4byte 0x00000312
_080C6804: .4byte 0x081F5D7C
_080C6808: .4byte 0x08AC1108
_080C680C: .4byte 0x08B1CD80
_080C6810: .4byte 0x03005270

