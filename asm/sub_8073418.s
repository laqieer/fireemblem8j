	.syntax unified
	.section .text.sub_8073418, "ax", %progbits
@ EfxTmCpyExt @ JP 0x08073418 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxTmCpyExt
	.thumb_func
EfxTmCpyExt:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	mov sl, r6
	ldr r6, [sp, #0x34]
	mov sb, r6
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r8, r1
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov ip, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #0
	beq _080734A8
	subs r0, r1, r7
	lsls r0, r0, #0x10
	str r0, [sp]
	subs r0, r3, r7
	lsls r0, r0, #0x10
	str r0, [sp, #4]
_08073458:
	adds r1, r7, #0
	subs r6, r2, #1
	cmp r1, #0
	beq _0807348A
	movs r2, #1
	rsbs r2, r2, #0
	mov r0, sl
	lsls r3, r0, #0xc
_08073468:
	ldrh r0, [r5]
	cmp sl, r2
	beq _08073474
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08073474:
	cmp sb, r2
	beq _0807347E
	add r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0807347E:
	strh r0, [r4]
	adds r5, #2
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _08073468
_0807348A:
	ldr r2, _080734B8 @ =0xFFFF0000
	asrs r1, r2, #0x10
	cmp r8, r1
	beq _08073498
	ldr r2, [sp]
	lsrs r0, r2, #0xf
	adds r5, r5, r0
_08073498:
	cmp ip, r1
	beq _080734A2
	ldr r1, [sp, #4]
	lsrs r0, r1, #0xf
	adds r4, r4, r0
_080734A2:
	adds r2, r6, #0
	cmp r2, #0
	bne _08073458
_080734A8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080734B8: .4byte 0xFFFF0000

