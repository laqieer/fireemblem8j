	.syntax unified
	.section .text.GetLeaderLevelForSaveMenu, "ax", %progbits
@ GetLeaderLevelForSaveMenu @ JP 0x080AF224 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetLeaderLevelForSaveMenu
	.thumb_func
GetLeaderLevelForSaveMenu:
	push {lr}
	ldr r1, _080AF23C @ =0x0203EF60
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AF236
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _080AF240
_080AF236:
	movs r0, #1
	rsbs r0, r0, #0
	b _080AF244
	.align 2, 0
_080AF23C: .4byte 0x0203EF60
_080AF240:
	movs r0, #1
	ldrsb r0, [r1, r0]
_080AF244:
	pop {r1}
	bx r1

