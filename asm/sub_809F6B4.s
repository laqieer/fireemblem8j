	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.section .text.sub_809F6B4, "ax", %progbits
@ sub_809F6B4 @ JP 0x0809F6B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F6B4
	.thumb_func
sub_809F6B4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r7, r5, #0
	adds r0, r5, #7
	cmp r5, r0
	bge _0809F704
	ldr r0, _0809F710 @ =0x02012F56
	ldrh r0, [r0]
	cmp r5, r0
	bge _0809F704
	ldr r1, _0809F714 @ =0x020122D4
	lsls r0, r5, #2
	adds r6, r0, r1
_0809F6D4:
	ldrh r0, [r6, #2]
	lsls r4, r5, #1
	movs r1, #0x1f
	ands r4, r1
	lsls r4, r4, #6
	adds r4, #2
	add r4, r8
	bl GetItemIconId
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #7
	bl DrawIcon
	adds r6, #4
	adds r5, #1
	adds r0, r7, #7
	cmp r5, r0
	bge _0809F704
	ldr r0, _0809F710 @ =0x02012F56
	ldrh r0, [r0]
	cmp r5, r0
	blt _0809F6D4
_0809F704:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F710: .4byte 0x02012F56
_0809F714: .4byte 0x020122D4

