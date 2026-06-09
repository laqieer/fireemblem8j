	.syntax unified
	.set DisableEfxStatusUnits, 0x0805583C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8053C9C, "ax", %progbits
@ sub_8053C9C @ JP 0x08053C9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053C9C
	.thumb_func
sub_8053C9C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08053CD0 @ =0x02017728
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _08053CD4 @ =0x02017734
	movs r0, #1
	str r0, [r1]
	ldr r0, _08053CD8 @ =0x085E393C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	bl DisableEfxStatusUnits
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053CD0: .4byte 0x02017728
_08053CD4: .4byte 0x02017734
_08053CD8: .4byte 0x085E393C

