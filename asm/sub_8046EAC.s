	.syntax unified
	.set DrawLinkArenaModeIcon, 0x08046DF4 + 1
	.set DrawLinkArenaRankIcon, 0x08046DBC + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8046E18, 0x08046E18 + 1
	.section .text.sub_8046EAC, "ax", %progbits
@ sub_8046EAC @ JP 0x08046EAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8046EAC
	.thumb_func
sub_8046EAC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, _08046F40 @ =0x0203DC44
	ldr r1, _08046F44 @ =0x020234AE
	mov sl, r1
	subs r7, r0, #4
	movs r1, #0x22
	add r1, sl
	mov sb, r1
	mov r8, r0
_08046ECA:
	lsls r5, r6, #3
	ldr r0, _08046F48 @ =0x0203DB10
	adds r5, r5, r0
	adds r0, r5, #0
	bl sub_8003CF8
	ldrb r0, [r7]
	lsls r2, r0, #0x1e
	lsrs r2, r2, #6
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	ldr r3, [r7]
	lsls r3, r3, #0xb
	lsrs r3, r3, #0x10
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r0, #1
	str r0, [sp]
	adds r0, r5, #0
	mov r1, r8
	bl sub_8046E18
	lsls r4, r6, #7
	mov r1, sl
	adds r0, r4, r1
	adds r1, r6, #0
	bl DrawLinkArenaRankIcon
	mov r0, sl
	adds r0, #6
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	ldrb r1, [r7]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1f
	mov r0, sb
	bl DrawLinkArenaModeIcon
	adds r7, #0x14
	movs r0, #0x80
	add sb, r0
	movs r1, #0x14
	add r8, r1
	adds r6, #1
	cmp r6, #9
	ble _08046ECA
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046F40: .4byte 0x0203DC44
_08046F44: .4byte 0x020234AE
_08046F48: .4byte 0x0203DB10

