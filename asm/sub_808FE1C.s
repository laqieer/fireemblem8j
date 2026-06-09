	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set ResetText, 0x08003BC4 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8004320, 0x08004320 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_808C1FC, 0x0808C1FC + 1
	.section .text.sub_808FE1C, "ax", %progbits
@ sub_808FE1C @ JP 0x0808FE1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808FE1C
	.thumb_func
sub_808FE1C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x7c
	add r5, sp, #0x18
	bl ResetText
	bl sub_8004320
	add r7, sp, #8
	add r0, sp, #0x10
	mov r8, r0
	mov r4, sp
	movs r6, #2
_0808FE38:
	adds r0, r4, #0
	movs r1, #0x16
	bl InitText
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bge _0808FE38
	movs r1, #0
	str r1, [r5, #0x30]
	mov r0, sp
	str r0, [r5, #0x34]
	str r7, [r5, #0x38]
	mov r0, r8
	str r0, [r5, #0x3c]
	adds r0, r5, #0
	adds r0, #0x5c
	strh r1, [r0]
	ldr r0, _0808FEA8 @ =0x0000082B
	bl sub_8009FA8
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_808C1FC
	ldr r4, _0808FEAC @ =0x02022E30
	mov r0, sp
	adds r1, r4, #0
	bl PutText
	adds r1, r4, #0
	adds r1, #0xc0
	adds r0, r7, #0
	bl PutText
	movs r0, #0xa0
	lsls r0, r0, #1
	adds r4, r4, r0
	mov r0, r8
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x7c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808FEA8: .4byte 0x0000082B
_0808FEAC: .4byte 0x02022E30

