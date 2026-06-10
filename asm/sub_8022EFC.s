	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_8025280, 0x08025280 + 1
	.section .text.sub_8022EFC, "ax", %progbits
@ sub_8022EFC @ JP 0x08022EFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022EFC
	.thumb_func
sub_8022EFC:
	push {lr}
	ldr r0, _08022F40 @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022F48
	ldr r0, _08022F44 @ =0x0202BCAC
	adds r0, #0x3d
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08022F48
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08022F48
	adds r0, r2, #0
	bl sub_8025280
	bl GetSelectTargetCount
	cmp r0, #0
	beq _08022F48
	movs r0, #1
	b _08022F4A
	.align 2, 0
_08022F40: .4byte 0x03004DF0
_08022F44: .4byte 0x0202BCAC
_08022F48:
	movs r0, #3
_08022F4A:
	pop {r1}
	bx r1
	.align 2, 0

