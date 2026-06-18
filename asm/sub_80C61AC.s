	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C61AC, "ax", %progbits
@ GmapSugoAdvance @ JP 0x080C61AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GmapSugoAdvance
	.thumb_func
GmapSugoAdvance:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	mov sb, r3
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r8, sp
	ldr r6, _080C6214 @ =0x08AC1108
	adds r0, r6, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldrh r0, [r0, #0x34]
	mov r1, r8
	strh r0, [r1]
	movs r0, #2
	add r0, sp
	mov r8, r0
	adds r0, r6, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldrh r1, [r0, #0x36]
	mov r0, r8
	strh r1, [r0]
	mov r0, sp
	ldrh r0, [r0]
	subs r5, r5, r0
	strh r5, [r7]
	subs r4, r4, r1
	mov r1, sb
	strh r4, [r1]
	adds r4, #0x20
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	cmp r4, #0xdf
	bhi _080C621C
	ldrh r0, [r7]
	adds r0, #0x20
	lsls r0, r0, #0x10
	ldr r1, _080C6218 @ =0x012F0000
	cmp r0, r1
	bhi _080C621C
	movs r0, #1
	b _080C621E
	.align 2, 0
_080C6214: .4byte 0x08AC1108
_080C6218: .4byte 0x012F0000
_080C621C:
	movs r0, #0
_080C621E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

