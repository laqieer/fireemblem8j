	.syntax unified
	.section .text.sub_80145DC, "ax", %progbits
@ sub_80145DC @ JP 0x080145DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80145DC
	.thumb_func
sub_80145DC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r7, r1, #0
	mov sl, r2
	ldr r0, [sp, #0x28]
	mov ip, r0
	ldr r0, [sp, #0x34]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	lsls r0, r0, #0x18
	ldr r1, [sp, #0x30]
	str r1, [sp, #4]
	cmp r0, #0
	beq _0801465C
	movs r5, #0
	ldr r2, [sp, #0x2c]
	cmp r5, r2
	bge _080146A4
_0801460C:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _08014652
	lsls r3, r5, #6
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_0801461C:
	adds r0, r7, r2
	adds r4, r2, #1
	cmp r0, #0x1f
	bhi _0801464C
	mov r2, sl
	adds r1, r2, r5
	cmp r1, #0x1f
	bhi _0801464C
	lsls r1, r1, #6
	lsls r0, r0, #1
	ldr r2, [sp]
	adds r0, r0, r2
	adds r1, r1, r0
	mov r2, ip
	subs r0, r2, r4
	lsls r0, r0, #1
	ldr r2, [sp, #4]
	adds r0, r0, r2
	adds r0, r3, r0
	ldrh r0, [r0]
	add r0, sb
	mov r2, r8
	eors r0, r2
	strh r0, [r1]
_0801464C:
	adds r2, r4, #0
	cmp r2, ip
	blt _0801461C
_08014652:
	adds r5, r6, #0
	ldr r0, [sp, #0x2c]
	cmp r5, r0
	blt _0801460C
	b _080146A4
_0801465C:
	movs r5, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	bge _080146A4
	lsls r2, r7, #1
	mov r8, r2
_08014668:
	movs r2, #0
	adds r6, r5, #1
	cmp r2, ip
	bge _0801469C
	lsls r0, r5, #6
	ldr r1, [sp, #4]
	adds r4, r1, r0
	ldr r3, [sp]
	add r3, r8
_0801467A:
	adds r0, r7, r2
	cmp r0, #0x1f
	bhi _08014692
	mov r0, sl
	adds r1, r0, r5
	cmp r1, #0x1f
	bhi _08014692
	lsls r1, r1, #6
	adds r1, r1, r3
	ldrh r0, [r4]
	add r0, sb
	strh r0, [r1]
_08014692:
	adds r4, #2
	adds r3, #2
	adds r2, #1
	cmp r2, ip
	blt _0801467A
_0801469C:
	adds r5, r6, #0
	ldr r1, [sp, #0x2c]
	cmp r5, r1
	blt _08014668
_080146A4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

