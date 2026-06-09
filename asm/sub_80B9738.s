	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8010F98, 0x08010F98 + 1
	.section .text.sub_80B9738, "ax", %progbits
@ sub_80B9738 @ JP 0x080B9738 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9738
	.thumb_func
sub_80B9738:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080B9760 @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080B976C
	ldr r0, _080B9764 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080B976C
	ldr r0, _080B9768 @ =0x08ABC7C8
	adds r1, r2, #0
	bl Proc_StartBlocking
	b _080B9770
	.align 2, 0
_080B9760: .4byte 0x0202BCAC
_080B9764: .4byte 0x03005270
_080B9768: .4byte 0x08ABC7C8
_080B976C:
	bl sub_8010F98
_080B9770:
	pop {r0}
	bx r0

