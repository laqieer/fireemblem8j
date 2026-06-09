	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8019C78, 0x08019C78 + 1
	.set sub_8019E4C, 0x08019E4C + 1
	.set sub_8019E78, 0x08019E78 + 1
	.section .text.RefreshEntityBmMaps, "ax", %progbits
@ RefreshEntityBmMaps @ JP 0x08019ECC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RefreshEntityBmMaps
	.thumb_func
RefreshEntityBmMaps:
	push {lr}
	ldr r0, _08019F08 @ =0x0202E4D4
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _08019F0C @ =0x0202E4E8
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _08019F10 @ =0x0202E4E4
	ldr r2, [r0]
	movs r1, #0
	ldr r0, _08019F14 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _08019EF2
	movs r1, #1
_08019EF2:
	adds r0, r2, #0
	bl sub_80194BC
	bl sub_8019E4C
	bl sub_8019C78
	bl sub_8019E78
	pop {r0}
	bx r0
	.align 2, 0
_08019F08: .4byte 0x0202E4D4
_08019F0C: .4byte 0x0202E4E8
_08019F10: .4byte 0x0202E4E4
_08019F14: .4byte 0x0202BCEC

