	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80AF1F8, "ax", %progbits
@ sub_80AF1F8 @ JP 0x080AF1F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF1F8
	.thumb_func
sub_80AF1F8:
	push {lr}
	ldr r1, _080AF214 @ =0x0203EF60
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AF21C
	ldr r2, _080AF218 @ =0x088582BC
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0]
	bl sub_8009FA8
	b _080AF21E
	.align 2, 0
_080AF214: .4byte 0x0203EF60
_080AF218: .4byte 0x088582BC
_080AF21C:
	movs r0, #0
_080AF21E:
	pop {r1}
	bx r1
	.align 2, 0

