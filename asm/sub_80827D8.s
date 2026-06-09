	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001570, 0x08001570 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80827D8, "ax", %progbits
@ sub_80827D8 @ JP 0x080827D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80827D8
	.thumb_func
sub_80827D8:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r1, #0
	ldr r1, _0808285C @ =0x08A14B2C
	mov r8, r1
	lsls r5, r0, #1
	adds r5, r5, r0
	lsls r5, r5, #2
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r2, _08082860 @ =0x081F528C
	lsls r1, r6, #2
	adds r1, r1, r2
	ldr r4, [r1]
	lsls r1, r4, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_8013008
	mov r0, r8
	adds r0, #8
	adds r0, r5, r0
	ldr r0, [r0]
	ldr r1, _08082864 @ =0x02020188
	mov sb, r1
	bl sub_8013008
	ldr r0, _08082868 @ =0x02023CA8
	ldr r1, _0808286C @ =0x081F5294
	adds r6, r6, r1
	ldrb r6, [r6]
	lsls r1, r6, #0xc
	orrs r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r4, [sp]
	mov r1, sb
	movs r2, #0
	movs r3, #0
	bl sub_8001570
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r2, #4
	add r8, r2
	add r5, r8
	ldr r0, [r5]
	lsls r6, r6, #5
	adds r1, r6, #0
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8001EE4
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808285C: .4byte 0x08A14B2C
_08082860: .4byte 0x081F528C
_08082864: .4byte 0x02020188
_08082868: .4byte 0x02023CA8
_0808286C: .4byte 0x081F5294

