	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8011C88, 0x08011C88 + 1
	.section .text.sub_8011D78, "ax", %progbits
@ sub_8011D78 @ JP 0x08011D78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8011D78
	.thumb_func
sub_8011D78:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r4, r3, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0xa0
	lsls r3, r3, #7
	movs r2, #9
	str r2, [sp]
	str r4, [sp, #4]
	adds r2, r5, #0
	bl sub_8011C88
	ldr r0, _08011DAC @ =0x085BA2AC
	adds r1, r4, #0
	bl Proc_StartBlocking
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011DAC: .4byte 0x085BA2AC

