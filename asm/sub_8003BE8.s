	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8003BC0, 0x08003BC0 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.section .text.InitTextFont, "ax", %progbits
@ InitTextFont @ JP 0x08003BE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitTextFont
	.thumb_func
InitTextFont:
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _08003BF2
	ldr r4, _08003C1C @ =0x02028E58
_08003BF2:
	str r1, [r4]
	ldr r0, _08003C20 @ =GetTextDrawDest
	str r0, [r4, #0xc]
	movs r1, #0
	strh r3, [r4, #0x14]
	lsls r0, r3, #0xc
	adds r0, r2, r0
	strh r0, [r4, #0x10]
	strh r1, [r4, #0x12]
	bl sub_8003BC0
	strb r0, [r4, #0x16]
	adds r0, r4, #0
	bl SetTextFont
	bl sub_80042E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003C1C: .4byte 0x02028E58
_08003C20: .4byte 0x08004121  @ GetTextDrawDest

