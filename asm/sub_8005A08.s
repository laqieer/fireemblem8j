	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80058D0, 0x080058D0 + 1
	.section .text.StartFaceChibiSpr, "ax", %progbits
@ StartFaceChibiSpr @ JP 0x08005A08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartFaceChibiSpr
	.thumb_func
StartFaceChibiSpr:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r0, r2, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	ldr r7, [sp, #0x24]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	adds r1, r6, #0
	adds r2, r4, #0
	bl sub_80058D0
	ldr r0, _08005A50 @ =0x085B8F70
	adds r1, r7, #0
	bl sub_8002BCC
	adds r1, r0, #0
	mov r0, r8
	strh r0, [r1, #0x34]
	mov r0, sb
	strh r0, [r1, #0x36]
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #0xc
	adds r6, r6, r4
	strh r6, [r1, #0x3c]
	cmp r5, #0
	beq _08005A58
	ldr r0, _08005A54 @ =0x085B8F8E
	b _08005A5A
	.align 2, 0
_08005A50: .4byte 0x085B8F70
_08005A54: .4byte 0x085B8F8E
_08005A58:
	ldr r0, _08005A68 @ =0x085B8F80
_08005A5A:
	str r0, [r1, #0x38]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005A68: .4byte 0x085B8F80

