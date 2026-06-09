	.syntax unified
	.set GetEkrDragonStatusType, 0x0807201C + 1
	.set sub_8072768, 0x08072768 + 1
	.set sub_8072E74, 0x08072E74 + 1
	.set sub_8078960, 0x08078960 + 1
	.section .text.sub_8050EE8, "ax", %progbits
@ sub_8050EE8 @ JP 0x08050EE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050EE8
	.thumb_func
sub_8050EE8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _08050EFC
	ldr r0, _08050EF8 @ =sub_8050FB8
	str r0, [r4, #0xc]
	b _08050F8E
	.align 2, 0
_08050EF8: .4byte 0x08050FB9  @ sub_8050FB8
_08050EFC:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08050F48
	ldr r0, _08050F1C @ =0x02000000
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #2
	beq _08050F2E
	cmp r0, #2
	bhi _08050F20
	cmp r0, #1
	beq _08050F26
	b _08050F40
	.align 2, 0
_08050F1C: .4byte 0x02000000
_08050F20:
	cmp r0, #3
	beq _08050F36
	b _08050F40
_08050F26:
	ldr r0, [r4, #0x5c]
	bl sub_8072768
	b _08050F3C
_08050F2E:
	ldr r0, [r4, #0x5c]
	bl sub_8078960
	b _08050F3C
_08050F36:
	ldr r0, [r4, #0x5c]
	bl sub_8072E74
_08050F3C:
	ldr r0, _08050F44 @ =sub_8050F98
	str r0, [r4, #0xc]
_08050F40:
	movs r0, #1
	b _08050F86
	.align 2, 0
_08050F44: .4byte 0x08050F99  @ sub_8050F98
_08050F48:
	ldr r0, _08050F60 @ =0x02000000
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #2
	beq _08050F72
	cmp r0, #2
	bhi _08050F64
	cmp r0, #1
	beq _08050F6A
	b _08050F84
	.align 2, 0
_08050F60: .4byte 0x02000000
_08050F64:
	cmp r0, #3
	beq _08050F7A
	b _08050F84
_08050F6A:
	ldr r0, [r4, #0x5c]
	bl sub_8072768
	b _08050F80
_08050F72:
	ldr r0, [r4, #0x5c]
	bl sub_8078960
	b _08050F80
_08050F7A:
	ldr r0, [r4, #0x5c]
	bl sub_8072E74
_08050F80:
	ldr r0, _08050F94 @ =sub_8050F98
	str r0, [r4, #0xc]
_08050F84:
	movs r0, #0
_08050F86:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #1
	str r0, [r4, #0x48]
_08050F8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050F94: .4byte 0x08050F99  @ sub_8050F98

